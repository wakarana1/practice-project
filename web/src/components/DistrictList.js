// import { gql, useQuery } from "@apollo/client";
// import Box from "@mui/material/Box";
// import Paper from "@mui/material/Paper";
// import * as React from "react";
// import District from "./District";

// const GET_DISTRICTS = gql`
//   query getDistricts {
//     districts {
//       id
//       name
//     }
//   }
// `;

// const DistrictList = () => {
//   const { loading, error, data } = useQuery(GET_DISTRICTS);
//   if (loading) return "Loading...";
//   if (error) return `Error! ${error.message}`;
//   const districts = data?.districts || [];

//   return (
//     <>
//       <Box
//         sx={{
//           display: "flex",
//           justifyContent: "center",
//           alignItems: "center",
//           height: "80vh",
//         }}
//       >
//         <Paper sx={{ width: "50vw" }}>
//           {districts && districts.map((district) => (
//             <District
//               key={district.id} {...district}
//             />
//             ))}
//         </Paper>
//       </Box>
//     </>
//   );

// };
// export default DistrictList;
