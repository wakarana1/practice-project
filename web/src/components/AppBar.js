import AppBar from "@mui/material/AppBar";
import IconButton from "@mui/material/IconButton";
import Toolbar from "@mui/material/Toolbar";
import Typography from "@mui/material/Typography";
import React, { useState } from "react";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import { Link } from 'react-router-dom'
import ModalDialog from "./ModalDialog";

const TuitionAppBar = () => {
  const [open, setOpen] = useState(false);

  const handleOpen = () => {
    setOpen(true);
  }
  const handleClose = () => {
    setOpen(false);
  }

  return(
    <AppBar position="static">
      <Toolbar>
        <IconButton
          size="large"
          edge="start"
          color="inherit"
          aria-label="menu"
          sx={{ mr: 2 }}
          ></IconButton>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          <Link className="nav-link" to="/"><Button variant="text" sx={{ color: "white" }}>Tuition Finder</Button></Link>
          </Typography>
        <Box sx={{ display: 'block' }}>
          <Button variant="contained" onClick={handleOpen} >Childcare Centers</Button>
          <ModalDialog open={open} handleClose={handleClose} />
        </Box>
      </Toolbar>
    </AppBar>
  )
};
export default TuitionAppBar;
