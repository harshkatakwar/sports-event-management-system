package sems

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class FixtureSpec extends Specification implements DomainUnitTest<Fixture> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
