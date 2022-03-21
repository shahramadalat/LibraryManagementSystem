﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementApplication.Models
{
    internal class Person
    {
        public int PersonId { get; set; }
        public string FullName { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }
        public string Phone { get; set; }
        public string CartId { get; set; }
    }
}
