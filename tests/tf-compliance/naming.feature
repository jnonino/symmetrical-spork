Feature: Naming Convention
    In order to make it easier to find resources
    I need all resources names to start with the project name.

    Scenario Outline: Naming Standard on all available resources
        Given I have <resource_name> defined
        When it contains <name_key>
        Then its value must match the "spork.*" regex

        Examples:
        | resource_name           | name_key |
        | aws_ecs_cluster         | name     |
        | aws_iam_role            | name     |
        | aws_lb                  | name     |
        | aws_security_group      | name     |
        | aws_eip                 | name     |
        | aws_internet_gateway    | name     |
        | aws_nat_gateway         | name     |
        | aws_route_table         | name     |
        | aws_subnet              | name     |
        | aws_vpc                 | name     |
        | aws_iam_role            | name     |