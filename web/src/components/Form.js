import React, {useState} from 'react';
import { TextField, Button, Stack, MenuItem } from '@mui/material';
import { gql, useQuery } from "@apollo/client";
import { Link, useNavigate } from "react-router-dom"

const GET_TUITION_OPTIONS = gql`
  query getTuitionOptions {
    tuitionOptions
  }
`;

const Form = ({handleClose}) => {
  const [household, setHousehold] = useState(0)
  const [income, setIncome] = useState(0)
  const [tuitionOption, setTuitionOption] = useState('')
  const navigate = useNavigate();
  const { loading, error, data } = useQuery(GET_TUITION_OPTIONS);
  if (loading) return "Loading...";
  if (error) return `Error! ${error.message}`;
  const tuitionOptions = data?.tuitionOptions || [];

  function checkInput() {
    if(household < 2) return true;
    if(tuitionOption === '') return true;
    return false;
  }

  function handleSubmit(event) {
    event.preventDefault();
    navigate("/centers", {state: {household: household, income: income, tuitionOption: tuitionOption}})
    handleClose();
  }

  return (
    <>
      <h2>Register Form</h2>
      <form onSubmit={handleSubmit} action={<Link to="/centers" />}>
        <Stack spacing={2} direction="row">
          <TextField
            type="number"
            variant='outlined'
            color='secondary'
            label="Household Size"
            InputProps={{
              inputProps: { min: 0 }
            }}
            onChange={e => setHousehold(e.target.value)}
            value={household}
            fullWidth
            required
          />
          <TextField
            type="number"
            variant='outlined'
            color='secondary'
            label="Household Income"
            InputProps={{
              inputProps: { min: 0 }
            }}
            onChange={e => setIncome(e.target.value)}
            value={income}
            fullWidth
            required
          />
        </Stack>
        <Stack>
          <TextField
            select
            label="Select"
            defaultValue=""
            onChange={e => setTuitionOption(e.target.value)}
            required
          >
            {tuitionOptions.map((tuitionOption) => (
              <MenuItem
                key={tuitionOption}
                value={tuitionOption}
              >
                {tuitionOption}
              </MenuItem>
            ))}
          </TextField>
        </Stack>
        <Stack direction="row" spacing={2} justifyContent="flex-end">
          <Button variant="outlined" color="secondary" type="close" onClick={handleClose}>Cancel</Button>
          <Button variant="contained" color="primary" type="submit" onClick={handleClose} disabled={checkInput()}>Register</Button>
        </Stack>
      </form>
    </>
  )
}

export default Form;