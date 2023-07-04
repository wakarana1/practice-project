import Box from "@mui/material/Box";

const District = (district) => {
  return (
    <Box
      id={district.id}
      sx={{
        display: "flex",
        alignItems: "center",
        p: 2,
        borderBottom: "1px solid #ccc",
      }}
    >
      {district.name}
    </Box>
  )
};
export default District;