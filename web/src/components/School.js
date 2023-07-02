import Box from "@mui/material/Box";

const School = (school) => {
  return (
    <Box
      id={school.id}
      sx={{
        display: "flex",
        alignItems: "center",
        p: 2,
        borderBottom: "1px solid #ccc",
      }}
    >
      {school.name}
    </Box>
  )
};
export default School;