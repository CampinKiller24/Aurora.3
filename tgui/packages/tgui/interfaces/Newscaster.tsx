import { useBackend } from '../backend';
import { Section, Table, Button, NoticeBox, Stack, LabeledList } from '../components';
import { BooleanLike } from '../../common/react';
import { NtosWindow } from '../layouts';

export type NewsData = {
  feed_channels: NewsChannel[]
  current_channel: NewsChannel;
};

type NewsChannel = {
  name: string;
  owner: string;
  censored: BooleanLike;
  public: BooleanLike;
  messages: string[]; //Do I need an array for all of them in a separate type? maybe and not have this here
};

export type WantedData = {
  wanted_issues: WantedIssue[]; //remove?
  active_issue: WantedIssue;
};

type WantedIssue = {
  name: string;
  description: string;
  photo: BooleanLike;
};

export const Newscaster = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);
    //Come back and do if sec newscaster for the sec options also wanted issue read if wanted issue
    return(
      <NtosWindow resizable width={300} height={500}>
        <NtosWindow.Content scrollable>
          <Section title="Feed Options">
            <Stack vertical>
              <Stack.Item>
                <Button
                  content="Create Feed Channel"
                  onClick={() => act('createchannel')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="View Feed Channels"
                  onClick={() => act('viewchannels')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Submit New Feed Story"
                  onClick={() => act('submitstory')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Print Newspaper"
                  onClick={() => act('printpaper')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Re-scan User"
                  onClick={() => act('rescanuser')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Exit"
                  color="red"
                  onClick={() => act('exit')}
                  />
              </Stack.Item>
            </Stack>
          </Section>
          <Section title="Feed Security Functions">
            <Stack vertical>
              <Stack.Item>
                <Button
                  content="Publish Wanted Issue"
                  onClick={() => act('wanted')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Censor Feed Stories"
                  onClick={() => act('censor')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Mark Feed Channel with SCC D-Notice"
                  onclick={() => act('dnotice')}
                  />
              </Stack.Item>
            </Stack>
          </Section>
        </NtosWindow.Content>
      </NtosWindow>
    );
};

export const CreateFeed = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);

  return(
      <Section 
        title="Create Feed Channel"
        buttons={
          <>
            <Button
              content="Submit"
              color="green"
              onClick={() => act('savefeed')}
              />
            <Button
              content="Cancel"
              color="red"
              onClick={() => act('mainmenu')}
              />
          </>
        }>
        <LabeledList>
          <LabeledList.Item label="Channel Name">
            //data here
            <Button
              icon="sticky-note"
              onClick={() => act('editname')}
              />
          </LabeledList.Item>
          <LabeledList.Item label="Channel Author">
            //data here
          </LabeledList.Item>
          <LabeledList.Item label="Will Accept Public Feeds">
            //data here
            <Button
              //data here (YES/NO)
              onClick={() => act('publicfeed')}
              />
          </LabeledList.Item>
        </LabeledList>
      </Section>
    
  );
};

export const ViewFeed = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);

  return(
    <Section
      title="Ship Feed Channels"
      buttons={
        <>
          <Button
            content="Refresh"
            color="lightblue"
            onClick={() => act('refresh')}
            />
          <Button
            content="Back"
            color="red"
            onClick={() => act('mainmenu')}
            />
        </>
      }>
        <LabeledList>
          //data here
          //channels here
        </LabeledList>
    </Section>
  );
};

export const ViewChannel = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);

  return(
    <Section
    title="//data Channel Name"
    buttons={
      <>
        <Button
          content="Refresh"
          color="lightblue"
          onClick={() => act('refresh')}
          />
        <Button
          content="Back"
          color="red"
          onClick={() => act('mainmenu')}
          />
      </>
    }>
      {data.current_channel && !data.current_channel.censored ? ( //Channel isn't D-Noticed
        {data.current_channel.messages.length ? //This needs to be if there are news stories on this channel
        (
        <Stack vertical>
          <Stack.Item>
            //news stories, buttons to view/add comment and like/dislike under each story and who it is authored by
          </Stack.Item>
        </Stack>
          ) : (
            <NoticeBox>No feed messages found in channel.</NoticeBox>
        )}
        ) : (
          <NoticeBox>This channel has been deemed as threatening to the welfare of the ship and marked with an SCC D-Notice. No further feed story additions are allowed while the D-Notice is in effect</NoticeBox>
        )}
    </Section>
  );
};

export const CreateWantedIssue = (props, context) => {
  const { act, data} = useBackend<WantedData>(context);

  return(
    <Section
    title="Wanted Issues"
    buttons={
      <>
        <Button
          content="Submit"
          color="green"
          onClick={() => act('savewantedissue')}
          />
        <Button
          content="Cancel"
          color="red"
          onClick={() => act('mainmenu')}
          />
      </>
    }>
      //If already an issue
        {data.active_issue ? (
          <NoticeBox>A wanted issue is already in circulation. You may edit it or cancel it below.</NoticeBox>
            <Stack vertical>
              <Stack.Item>
                <Button
                  content="Edit"
                  onClick={() => act('editwantedissue')}
                  />
              </Stack.Item>
              <Stack.Item>
                <Button
                  content="Cancel Wanted Issue"
                  color="red"
                  onClick={() => act('deletewantedissue')}
                  />
              </Stack.Item>
            </Stack>
        ) : (
      <LabeledList>
        <LabeledList.Item label="Name">
          //data
          <Button
            icon="user"
            tooltip="edit the name of the wanted person"
            onClick={() => act('editcriminalname')}
            />
        </LabeledList.Item>
        <LabeledList.Item label="Description">
          <Button
            icon="sticky-note"
            tooltip="edit the description of the suspect"
            onClick={() => act('editcriminaldesc')}
            />
        </LabeledList.Item>
        <LabeledList.Item label="Attach Photo">
          <Button
            icon="photo"
            tooltip="attach a photo of the suspect"
            onClick={() => act('attachcriminalphoto')}
            />
        </LabeledList.Item>
      </LabeledList>
        )}
    </Section>
  );
};

export const ViewWantedIssue = (props, context) => {
  const { act, data} = useBackend<WantedData>(context);

  return(

  );
};

export const ChannelList = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);

  return(
    <Section
    title="SCC Feed Censorship Tool"
    buttons={
      <>
        <Button
        content="Back"
        color="red"
        onClick={() => act('mainmenu')}
        />
      </>
    }>
      <Stack>
        //data and stack items of all channels, add buttons at top of each channel to D-Notice it
      </Stack>
  </Section>
  );
};

export const CensorStory = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);

  return(
    //same as Viewing but with the censor option for everything
  );
};