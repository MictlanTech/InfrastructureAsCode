

# Use Terraform Datasources to query AWS API for Regional IP Ranges assigned to EC2 service
data "aws_ip_ranges" "us_east_ip_range" {
    regions = ["us-east-1","us-east-2"] # Define the regions you would like to query
    services = ["ec2"] # You could replace or add services
}

# Create a Security Group based on Region filter
resource "aws_security_group" "sg-mictlan_117_us_east" {
    name = "mictlan_117_us_east"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.us_east_ip_range.cidr_blocks, 0, 50)
    }

    tags = {
        CreateDate = data.aws_ip_ranges.us_east_ip_range.create_date
        SyncToken = data.aws_ip_ranges.us_east_ip_range.sync_token
    }
}