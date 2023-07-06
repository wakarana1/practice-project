import { Dialog } from "@mui/material";
import Form from "./Form";
import { Container } from "@mui/system";

const ModalDialog = ({open, handleClose}) => {
  return(
    <Dialog open={open} onClose={handleClose} >
      <Container spacing={2} >
        <Form handleClose={handleClose} />
      </Container>
    </Dialog>
  )
};
export default ModalDialog;