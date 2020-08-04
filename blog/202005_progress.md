# Progress May 2020

* Mon 11th

  **Property Based Testing**

  - Ruby Theft gem - 0.0.1 not used https://spin.atomicobject.com/2014/09/30/quickcheck-in-ruby/
  - article on rantly with good limitations -http://www.troikatech.com/blog/2014/04/02/property-based-testing-in-ruby/
    - shrinking not as good
    - have to write most generators yourself - can lead to bugs
    - no mechanism for stateful code
    - integration with RSpec not that good
    - [ ] could run through the example
    - [ ] makes me think of what would be the advantage of using clojure for
      testing the API? speed and better generators? but even less integration?
      or couldl that work?
  - [ ] watch [Tropica Ruby 2015 - Property Testing on Rails by Andrew Rosa](https://www.youtube.com/watch?v=WKuZWzi2oRQ)
  - [ ] read
    - https://www.sitepoint.com/the-how-and-why-of-property-based-testing-in-ruby/
    - [ ] https://testguild.com/property-based-testing/
    - [ ] https://tech.labs.oliverwyman.com/blog/2013/03/16/ruby-property-testing-with-rantly/
  - [ ] hypothesis lib - 2 years old https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-ruby

  **turbine**

  - 

* Fri 22nd

  **Inventory**

  Look at what is involved in inventory managment software.

  Some keep points

  **Meat processing**

    [Basics of meat inventory](https://www.meatchris.com/blog/meat-inventory-management)
      1. understand yields
        * bi products
        * value your labor
        * merchendising bi products
      1. understand cost of sitting on product
        * value of product
        * sitting on cheap product vs filling freezer with more expensive product
      1. product rotation
        * document every item in your freezer

    - [x] [Activate webinar](https://acctivate.com/webinar/year-end-inventory-counts/)
      * once a year physical count vs cylce count (weekly/monthly)
      * bin locations to segment out inventory
      * A/B/C classificaiton of inventory value 20% of products that make up 80%
        of sales are high value, the A group, should be counted more often.
      * segment out by product class or type
      * need schedule
      * track theft and losses
      * blind count to NOT show last count and reduce guestimations

    via https://acctivate.com/webinar/topic/inventory/
    - [ ] Lot/Serial & lot and seiral traceability
    - [ ] Units of measure
    - [ ] advanced inventory managment

    - [x] [meat inventory mamagement - Michigan state uni](https://www.canr.msu.edu/foodsystems/uploads/files/Meat-Marketing-Meat-Inventory-Management.pdf)
      * buffer size calculation
      BUFFER SIZE = (Average Demand per Demand Period + Transportation Lead Time + Production Lead Time + Order Lead time + Safety Stock)

    - [x] [How to Inventory Meats at a Butcher Shop](https://smallbusiness.chron.com/inventory-meats-butcher-shop-33529.html)
      * inventory by cut, by date, by need

    * inventory is a branch of ERP (Enterpirise Resource Planning [wikipedia](https://en.wikipedia.org/wiki/Enterprise_resource_planning))
    * raw materials and ingerdients
    * bill of materials and recepie managment
    * meat yields
    * costs
    * traceability
    * boxing, weighing and labeling
    * interfacing with
      * weigh scales,
      * barcode scanners,
      * thermometers,
      * wireless sensors
      * RFID readers
    * EDI with suppliers/customers
    * forecasting future needs

  reference

  - [merit trax](http://merit-trax.com/meat-processing-software/)
  - [activate](https://acctivate.com/industries/beverage-food-distribution/meat-distribution-software/)
