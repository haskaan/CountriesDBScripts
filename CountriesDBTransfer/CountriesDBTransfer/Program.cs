using CountriesDBTransfer.DAL.MSSQL;
using CountriesDBTransfer.DAL.MySQL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CountriesDBTransfer
{
    public enum TransferStep
    {
        [Description("Başlangıç")]
        START,

        [Description("Country")]
        COUNTRY,

        [Description("City")]
        CITY,

        [Description("Town")]
        TOWN,

        [Description("District")]
        DISTRICT,

        [Description("Neighborhood")]
        NEIGHBORHOOD,

        [Description("DB Saving")]
        SAVING,

        [Description("Stop")]
        STOP
    }

    class Program
    {
        private static TransferStep TS;
        private static DateTime dateTime;

        static void Main(string[] args)
        {
            CountriesMSSQLEntities mssqlDB = new CountriesMSSQLEntities();
            CountriesMySQLEntities mysqlDB = new CountriesMySQLEntities();

            TS = TransferStep.START;
            dateTime = DateTime.Now;

            CountriesDBTransfer(mssqlDB, mysqlDB);


            Console.WriteLine("\nİşlem başarıyla bitmiştir.");
            Console.Read();
        }


        
        private static void CountriesDBTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            TS = TransferStep.COUNTRY;
            Extensions.TransferStepLog(TS, dateTime);
            TableCountriesTransfer(mssqlDB, mysqlDB);

            TS = TransferStep.CITY;
            Extensions.TransferStepLog(TS, dateTime);
            TableCitiesTransfer(mssqlDB, mysqlDB);

            TS = TransferStep.TOWN;
            Extensions.TransferStepLog(TS, dateTime);
            TableTownsTransfer(mssqlDB, mysqlDB);

            TS = TransferStep.DISTRICT;
            Extensions.TransferStepLog(TS, dateTime);
            TableDistrictsTransfer(mssqlDB, mysqlDB);

            TS = TransferStep.NEIGHBORHOOD;
            Extensions.TransferStepLog(TS, dateTime);
            TableNeighborhoodsTransfer(mssqlDB, mysqlDB);

            TS = TransferStep.SAVING;
            Extensions.TransferStepLog(TS, dateTime);
            mysqlDB.SaveChangesAsync();

            TS = TransferStep.STOP;
            Extensions.TransferStepLog(TS, dateTime);
        }

        private static void TableCountriesTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            var countriesQuery = (from c in mssqlDB.Countries.AsParallel()
                                  select new country()
                                  {
                                      CountryID = c.CountryID,
                                      BinaryCode = c.BinaryCode,
                                      PhoneCode = c.PhoneCode,
                                      TripleCode = c.TripleCode,
                                      CountryName = c.CountryName
                                  });

            mysqlDB.countries.AddRange(countriesQuery);
        }

        private static void TableCitiesTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            var citiesQuery = (from c in mssqlDB.Cities.AsParallel()
                                  select new city()
                                  {
                                      CityID = c.CityID,
                                      CountryID = c.CountryID,
                                      CityName = c.CityName,
                                      PhoneCode = c.PhoneCode,
                                      PlateNo = c.PlateNo
                                  });

            mysqlDB.cities.AddRange(citiesQuery);
        }

        private static void TableTownsTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            var countiesQuery = (from c in mssqlDB.Towns.AsParallel()
                                  select new town()
                                  {
                                      TownID = c.TownID,
                                      CityID = c.CityID,
                                      TownName = c.TownName
                                  });

            mysqlDB.towns.AddRange(countiesQuery);
        }

        private static void TableDistrictsTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            var areaQuery = (from a in mssqlDB.Districts.AsParallel()
                                  select new district()
                                  {
                                      DistrictID = a.DistrictID,
                                      TownID = a.TownID,
                                      DistrictName = a.DistrictName
                                  });

            mysqlDB.districts.AddRange(areaQuery);
        }

        private static void TableNeighborhoodsTransfer(CountriesMSSQLEntities mssqlDB, CountriesMySQLEntities mysqlDB)
        {
            var neighborhoodsQuery = (from n in mssqlDB.Neighborhoods.AsParallel()
                                  select new neighborhood()
                                  {
                                      NeighborhoodID = n.NeighborhoodID,
                                      DistrictID = n.DistrictID,
                                      NeighborhoodName = n.NeighborhoodName,
                                      ZipCode = n.ZipCode
                                  });

            mysqlDB.neighborhoods.AddRange(neighborhoodsQuery);
        }


    }
}
