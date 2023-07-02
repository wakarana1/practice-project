import { gql, useQuery } from "@apollo/client";
import Box from "@mui/material/Box";
import Paper from "@mui/material/Paper";
import * as React from "react";
import School from "./School";

const GET_SCHOOLS = gql`
  query GetSchools {
    schools {
      id
      name
    }
  }
`;

const SchoolList = () => {
  const { data: list } = useQuery(GET_SCHOOLS);
  const schools = list?.schools || [];

  return (
    <Box
      sx={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "80vh",
      }}
    >
      <Paper sx={{ width: "50vw" }}>
        {schools && schools.map((school) => (
          <School
            key={school.id} {...school}
          />
        ))}
      </Paper>
    </Box>
  );

};
export default SchoolList;
