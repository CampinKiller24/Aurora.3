import { useBackend } from '../backend';
import { Section, Table, Button, NoticeBox, Stack, LabeledList } from '../components';
import { BooleanLike } from '../../common/react';
import { NtosWindow } from '../layouts';

export const Newscaster = (props, context) => {
  const { act, data} = useBackend<NewsData>(context);
    //Come back and do if sec newscaster for the sec options
    return(
      <NtosWindow resizable width={300} height={500}>
        <NtosWindow.content scrollable>
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
        </NtosWindow.content>
      </NtosWindow>
    );
};

export const CreateFeed = (props, context) => {
  const { act, data} = useBackend<FeedData>(context);

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
  const { act, data} = useBackEnd<FeedData>(context);

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

