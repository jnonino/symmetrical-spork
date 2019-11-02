Feature: Only required ports are accessible
    In order to prevent vulnerabilities
    I need a only required ports are opened.

    Scenario: No publicly open ports
        Given I have AWS Security Group defined
        When it contains ingress
        Then it must not have tcp protocol and port 1024-65535 for 0.0.0.0/0

    Scenario: No SSH port open
        Given I have AWS Security Group defined
        When it contains ingress
        Then it must not have tcp protocol and port 22 for 0.0.0.0/0

    Scenario: Only selected ports should be publicly open
        Given I have AWS Security Group defined
        When it contains ingress
        Then it must only have tcp protocol and port 80 for 0.0.0.0/0
