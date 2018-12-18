//
//  CarRentalResponseTests.swift
//  CarRentalTests
//
//  Created by Yariv Nissim on 12/17/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import XCTest
@testable import CarRental

class CarRentalResponseTests: XCTestCase {
    func testValidResponse() {
        XCTAssertNoThrow(try CarRentalResponse(data: validResponseData))
    }

    func testInvalidResponse() {
        XCTAssertThrowsError(try CarRentalResponse(data: Data()))
    }
}

private let validResponseData = """
{
  "results" : [ {
    "provider" : {
      "company_code" : "ZD",
      "company_name" : "BUDGET"
    },
    "branch_id" : "IFPT01",
    "location" : {
      "latitude" : 35.16553,
      "longitude" : -114.55673
    },
    "airport" : "IFP",
    "address" : {
      "line1" : "LAUGHLIN/BULLHEAD INT L APO",
      "city" : "BULLHEAD CITY",
      "region" : "AZ",
      "country" : "US"
    },
    "cars" : [ {
      "vehicle_info" : {
        "acriss_code" : "ECAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Economy",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "270.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "356.61",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "CCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Compact",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "276.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "364.12",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "ICAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "288.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "379.18",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "324.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "424.32",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "324.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "424.32",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "IFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "484.77",
          "currency" : "USD"
        }
      }, {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "427.00",
          "currency" : "EUR"
        }
      } ],
      "estimated_total" : {
        "amount" : "498.35",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "444.06",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "574.86",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "RFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard Elite",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "576.06",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "740.36",
        "currency" : "USD"
      }
    } ]
  }, {
    "provider" : {
      "company_code" : "ZE",
      "company_name" : "HERTZ"
    },
    "branch_id" : "IFPT34",
    "location" : {
      "latitude" : 35.15,
      "longitude" : -114.5667
    },
    "airport" : "IFP",
    "address" : {
      "line1" : "2550 LAUGHLIN VIEW DR.",
      "city" : "BULLHEAD CITY 864295872",
      "region" : "AZ",
      "country" : "US"
    },
    "cars" : [ {
      "vehicle_info" : {
        "acriss_code" : "ECAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Economy",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "462.50",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "462.50",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "CCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Compact",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "471.75",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "471.75",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "ICAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "499.50",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "499.50",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "525.40",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "525.40",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "545.75",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "545.75",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "PCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Premium",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "599.40",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "599.40",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "IFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "601.25",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "601.25",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "641.95",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "641.95",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FRAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "Recreational vehicle"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "697.45",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "697.45",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "MVAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Mini",
        "type" : "Passenger van"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "703.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "703.00",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "PFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Premium",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "1058.20",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "1058.20",
        "currency" : "USD"
      }
    } ]
  }, {
    "provider" : {
      "company_code" : "ET",
      "company_name" : "ENTERPRISE"
    },
    "branch_id" : "IFPT01",
    "location" : {
      "latitude" : 35.15,
      "longitude" : -114.5667
    },
    "airport" : "IFP",
    "address" : {
      "line1" : "2550 LAUGHLIN VIEW DR STE 153",
      "city" : " BULLHEAD CITY",
      "region" : "AZ",
      "country" : "US"
    },
    "cars" : [ {
      "vehicle_info" : {
        "acriss_code" : "ECAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Economy",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "179.59",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "238.71",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "XXAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Special",
        "type" : "Special"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "188.62",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "250.03",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "CCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Compact",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "188.62",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "250.03",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "ICAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "197.64",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "261.34",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "215.69",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "283.96",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "215.71",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "283.98",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "IFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "249.20",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "325.98",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "CFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Compact",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "249.20",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "325.98",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "277.12",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "360.98",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SPAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "Pickup (regular cab)"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "359.99",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "464.89",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "MVAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Mini",
        "type" : "Passenger van"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "405.23",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "521.60",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "PPAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Premium",
        "type" : "Pickup (regular cab)"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "409.99",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "527.57",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "449.10",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "576.61",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "PFAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Premium",
        "type" : "SUV"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "500.95",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "641.62",
        "currency" : "USD"
      }
    } ]
  }, {
    "provider" : {
      "company_code" : "ZI",
      "company_name" : "AVIS"
    },
    "branch_id" : "IFPT01",
    "location" : {
      "latitude" : 35.15,
      "longitude" : -114.5667
    },
    "airport" : "IFP",
    "address" : {
      "line1" : "LAUGHLIN/BULLHEAD INT L APO",
      "city" : "BULLHEAD CITY",
      "region" : "AZ",
      "country" : "US"
    },
    "cars" : [ {
      "vehicle_info" : {
        "acriss_code" : "ECAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Economy",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "307.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "398.48",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "CCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Compact",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "326.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "422.31",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "ICAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Intermediate",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "353.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "456.16",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "SCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Standard",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "357.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "461.17",
        "currency" : "USD"
      }
    }, {
      "vehicle_info" : {
        "acriss_code" : "FCAR",
        "transmission" : "Automatic",
        "fuel" : "Unspecified",
        "air_conditioning" : true,
        "category" : "Fullsize",
        "type" : "2/4 Door"
      },
      "rates" : [ {
        "type" : "WEEKLY",
        "price" : {
          "amount" : "414.00",
          "currency" : "USD"
        }
      } ],
      "estimated_total" : {
        "amount" : "532.65",
        "currency" : "USD"
      }
    } ]
  } ]
}
""".data(using: .utf8)!
