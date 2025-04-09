using ChemicalReport.API.Models;
using System.Data;
using Dapper;
using System.Data.SqlClient;

namespace ChemicalReport.API.Services
{
    public class UserService
    {
        private readonly string _connectionString;

        public UserService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public IEnumerable<User> GetAllUsers()
        {
            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                string sql = "SELECT Id, Name, Email, RoleId FROM Users";
                return db.Query<User>(sql).ToList();
            }
        }
    }
}
