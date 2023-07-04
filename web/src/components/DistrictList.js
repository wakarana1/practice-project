import { gql, useQuery } from "@apollo/client";
import Box from "@mui/material/Box";
import Paper from "@mui/material/Paper";
import * as React from "react";
import District from "./District";

const GET_DISTRICTS = gql`
  query getDistricts {
    districts {
      id
      name
    }
  }
`;

const DistrictList = () => {
  const { data: list } = useQuery(GET_DISTRICTS);
  const districts = list?.districts || [];

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
        {districts && districts.map((district) => (
          <District
            key={district.id} {...district}
          />
        ))}
      </Paper>
    </Box>
  );

};
export default DistrictList;
