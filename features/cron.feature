Feature: run cron job

  Background:
    Given the "mail" job exists

  Scenario: Not receiving a expiration reminder too early
    And the "hello" job has fired

  # Scenario: Mail send test
  #   And the "send_email" job has fired
