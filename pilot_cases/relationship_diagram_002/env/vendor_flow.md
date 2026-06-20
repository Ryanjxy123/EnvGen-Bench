# Vendor Intake Data Flow

Supplier Portal sends vendor forms to Intake API. Intake API validates tax IDs
through Compliance Service. Intake API writes approved vendor records to Vendor
Database and publishes vendor_approved messages to Onboarding Queue. Onboarding
Worker consumes the queue and creates setup tickets in Ticketing System.
Analytics Export reads Vendor Database nightly but is not part of intake flow.
