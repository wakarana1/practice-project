import { Routes, Route } from 'react-router-dom'
import { ApolloClient, ApolloProvider, InMemoryCache } from "@apollo/client";
import Box from "@mui/material/Box";
import "./App.css";
import AppBar from "./components/AppBar";
// import { DistrictRoutes } from './routes/DistrictRoutes';
import { NotFound } from './pages/NotFound';
import CenterList from "./components/CenterList";

const client = new ApolloClient({
  uri: "http://127.0.0.1:3001/graphql",
  cache: new InMemoryCache(),
});

const App = () => {
  return (
    <ApolloProvider client={client}>
      <Box sx={{ flexGrow: 1 }}>
        <AppBar />
      </Box>

      <Routes>
        <Route
          path="/"
          element={
            <div>
              <h1> Welcome to your tuition credit finder!</h1>
              <p> Please click on the 'Childcare Center' button to find how much you can save at childcare centers near you!</p>
            </div>
          }
        />
        {/* <Route path="/districts" element={<DistrictRoutes />} /> */}
        <Route path="/centers" element={<CenterList />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </ApolloProvider>
  )
};

export default App;
