package sems

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class FixtureResultSpec extends Specification implements DomainUnitTest<FixtureResult> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
