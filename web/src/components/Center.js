import Paper from '@mui/material/Paper';
import Typography from "@mui/material/Typography";
import Rating from "@mui/material/Rating";
import { styled } from '@mui/material/styles';

const Item = styled(Paper)(({ theme }) => ({
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.primary,
}));

const Center = ({center, prices}) => {
  const price = prices[center.rating]

  return (
    <Item>
      <Typography gutterBottom variant="subtitle1" component="div">
        {center.name}
      </Typography>
      <Rating name={`${center.name} rating`} value={center.rating} readOnly />
      <Typography variant="subtitle1" component="div">
        Possible tuition credit: ${price}
      </Typography>
    </Item>
  )
};
export default Center;