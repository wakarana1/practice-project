import { useLocation } from 'react-router-dom'
import { gql, useQuery } from "@apollo/client";
import * as React from "react";
import Center from "./Center";
import Stack from "@mui/material/Stack";
import Paper from "@mui/material/Paper";

const GET_CENTERS = gql`
  query getCenters {
    centers(districtId: 1) {
      id
      name
      rating
    }
  }
`;

const GET_TUITION_CREDITS = gql`
  query tuitionCreditsThroughHousehold($districtId: Int!, $householdSize: Int!, $income: Int!) {
    tuitionCreditsThroughHousehold(districtId: $districtId, householdSize: $householdSize, income: $income) {
      id
      rating
      fullDayCredit
      halfDayCredit
      extendedDayCredit
    }
  }
`

const CenterList = () => {
  const { loading, error, data } = useQuery(GET_CENTERS);
  const {state: {household, income, tuitionOption}} = useLocation();

  const { tuition_loading, tuition_error, data: tuitionData } = useQuery(GET_TUITION_CREDITS, {
    variables: {
      districtId: 1,
      householdSize: parseInt(household),
      income: parseInt(income)
    }
  });

  if (loading || tuition_loading) return "Loading...";
  if (error || tuition_error) {
    const message = error.message || tuition_error.message
    return `Error! ${message}`
  };

  const tuitionSelection = tuitionOption.replace(/ /g,"").charAt(0).toLowerCase() + tuitionOption.replace(/ /g,"").slice(1);
  const centers = data?.centers || [];
  const tuitionTypes = tuitionData?.tuitionCreditsThroughHousehold || [];

  const ratingPrice = tuitionTypes.reduce(function(obj, tuition) {
    obj[tuition.rating] = tuition[tuitionSelection];
    return obj;
  }, {} );

  return (
    <Paper elevation={0} sx={{margin: '30px'}}>
      <Stack
        container
        direction="column"
        spacing={2}
        sx={{
          margin: "auto",
          maxWidth: 500,
          flexGrow: 1,
        }}
      >
        {centers && centers.map((center) => (
          <Center
            center={center}
            prices={ratingPrice}

          />
        ))}
      </Stack>
    </Paper>
  );

};
export default CenterList;