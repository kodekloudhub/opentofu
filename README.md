# Lab Documentation

### Migrate Terraform to OpenTofu

1. Inspect the main.tf file and initialize the Terraform configuration and apply the local_file resource via terraform
    Solution: Run `terraform init` followed by `terraform apply`
    Validate: Check if the file `terraform.txt` exists (if possible check the contents for "This file has been created with Terraform")


2. What file has been created with the local_file resource?
    Quiz: What resource will be created?

a) terraform.tfstate
    
b) terraform.txt
    
c) opentofu.txt
    
d) opentofu.tfstate

    Solution: b) terraform.txt -- Check the files in the working directory with the `ls` command. There is a new `terraform.txt` file.


1. Backup state file via tar
    Solution: Run `tar czf terraform.tfstate.tar.gz terraform.tfstate`
    Validate: Check if the terraform.tfstate.tar.gz is created (if possible check contents if terraform.tfstate exists within the archive)


4. Verify OpenTofu version
    Quiz: Which OpenTofu version is installed

a) 1.3.2

b) 1.7.0

c) 1.6.1

d) 1.6.2

    Solution: c) 1.6.1 - Run `tofu --version` to check the version installed


1. Run `tofu init` to initialize the OpenTofu configuration
    Solution: Run `tofu init`
    Validate: Check if .terraform directory is created


6. Inspect the OpenTofu plan. 
    Quiz: What resource will be created?

a) terraform.tfstate

b) terraform.txt

c) opentofu.txt

d) opentofu.tfstate

    Solution: b) terraform.txt -- After running `tofu plan` the resource can be found under "filename = "terraform.txt"


7. Make a change to the filename and contents of the local_file resource.
    The filename should be `opentofu.txt` and the contents should be "This file has been created with OpenTofu"
    Solution: 
    The main.tf should have the following contents:

```
resource "local_file" "file" {
    filename = "opentofu.txt"
    content  = "This file has been created with OpenTofu"
}
```

Validate: Check if the file `main.tf` has the contents:

```
resource "local_file" "file" {
    filename = "opentofu.txt"
    content  = "This file has been created with OpenTofu"
}
```


8. Inspect tofu plan now
    Quiz: What resource will be created?

a) terraform.tfstate

b) terraform.txt

c) opentofu.txt

d) opentofu.tfstate

    Solution: b) opentofu.txt -- After running `tofu plan` the resource can be found under "filename = "opentofu.txt"
        The main.tf should have the following contents:

```
resource "local_file" "file" {
    filename = "opentofu.txt"
    content  = "This file has been created with OpenTofu"
}
```

Validate: Check if the file `main.tf` has the contents:

```
resource "local_file" "file" {
    filename = "opentofu.txt"
    content  = "This file has been created with OpenTofu"
}
```


9. Run tofu plan and tofu apply
    Solution: Run `tofu plan` followed by `tofu apply`
    Validate: Check if the file `opentofu.txt` exists (if possible check the contents for "This file has been created with OpenTofu")

### Migrate OpenTofu back to Terraform


10. Backup the statefile via tar
    Solution: Run `tar czf terraform.tfstate.tar.gz terraform.tfstate`
    Validate: Check if the terraform.tfstate.tar.gz is created (if possible check contents if terraform.tfstate exists within the archive)


11. Run `terraform init` to initialize Terraform
    Solution: Run `terraform init`
    Validate: Check if .terraform directory is created


12. Revert back the changes to local_file resource.
        The filename should be `terraform.txt` and the contents should be "This file has been created with Terraform"
    Solution: 
```
resource "local_file" "file" {
    filename = "terraform.txt"
    content  = "This file has been created with Terraform"
}
```

Validate: Check if the file `main.tf` has the contents:

```
resource "local_file" "file" {
    filename = "terraform.txt"
    content  = "This file has been created with Terraform"
}
```


13. Run `terraform apply` to apply the reverted changes to the local_file resource.
    Solution: Run `terraform apply`
    Validate: Check if the file `terraform.txt` exists (if possible check the contents for "This file has been created with Terraform")
