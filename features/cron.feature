Feature: run cron job

  Background:
    Given the "mail" job exists

  Scenario: Fire the job
    And the "hello" task has fired

