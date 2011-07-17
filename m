Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1QiVJU-00038m-Cb; Sun, 17 Jul 2011 19:39:32 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LOH00IE3KPZOJB2@vms173001.mailsrvcs.net>; Sun,
	17 Jul 2011 11:35:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 848F514AF5D; Sun,
	17 Jul 2011 12:34:47 -0400 (EDT)
Date: Sun, 17 Jul 2011 12:34:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-members@lists.openembedded.org,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-id: <20110717163447.GF21964@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Minutes: OpenEmbedded eV Board meeting, 11-Jul-2011
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jul 2011 17:39:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Minutes: OpenEmbedded eV Board meeting, 11-Jul-2011

Attendees:

Michael Lauer (mickey)
Philip Balister (Crofton)
Florian Boor (florian)
Denys Dmytriyenko (denix)


00) action items from last meeting:
* call for TSC elections (Mickey) - done
* call for OE eV General Assembly (Crofton) - done
* status update on sending money for the switch
  ** florian is waiting for additional info (bank address) from Jeff (OSUOSL) to initiate the transfer
  ** once received, florian has to go to the bank in person to make the transfer
  ** sent the reminder to Jeff, the required info was received after the meeting
* check and open a credit/debit card for simple money transfers
  ** florian to take care when at the bank
* call for donations
  ** denix checked with TI, waiting for after Yocto budget is approved to see if any money left after LF and Yocto fees
  ** Intel offered a donation too - need to follow up with Dirk or DaveSt
  ** encourage people to make individual donations

01) agenda:
* TSC elections
* LF server donation status
* more financial/donation discussion
* financial contributions to OSUOSL for hosting OE
* some/any financial support from LF/Yocto

02) TSC elections
* call for TSC candidates was made
* 2 weeks period is over - only 1 candidate (RP)
* is call for votes required?
* can one candidate be accepted by acllamation?
* there were no reminders at the end of 2 weeks encouraging more candidates
  ** should the reminder be sent now and period extended by 1-2 days?
  ** Board decides by majority that 2 weeks were enough for anyone interested to propose their candidacy
* Board agrees to suggest electing RP by acclamation on the list (Mickey)
  ** if nobody objects, close the voting and announce the results
* make a note to send reminders next time before the 2-week application/discussion/voting period is over
* during GA we should discuss and/or update the statutes covering this situation (acclamation) in detail

03) LF server donation status
* still in the process - the previous hardware specs were scrapped
* while talking to involved parties, it's not clear who's the legal recipient of the donation
  ** Tom King is in the talks with LF and OSUOSL directly
  ** are the servers donated to OSUOSL/nas-admin or OE eV/Board?
* need to talk to LF to clarify things
  ** who are the people involved, who's overseeing, paperwork?
  ** Crofton on travel, denix to cover for him during next Yocto-AB meeting and raise the above questions
* suggest involved parties (Tom, LF, OSUOSL) to copy the Board (board@openembedded.org) in ongoing discussions instead of direct peer-to-peer emails or random IRC chats
* possibly hold a conference call to make the process more transparent

04) is the corporate donation procedure documented?
* check the Wiki, update if needed
* there is some form needed to be filled
  ** Crofton has the copy from previous TI donation
  ** florian will work with Intel, consult with Crofton for any legal aspects

05) individual donations
* denix makes first individual donation through PayPal
  ** hopes to inspire others to donate... :)
* Crofton to donate an SSD

06) financial contributions to OSUOSL
* Tom reports that OE is consuming most of the free resources provided by OSUOSL to Open Source projects
  ** OE needs to be a good citizen and contribute financially back to OSUOSL, like other projects
* Mickey: what's consuming the resources - web, git?
  ** According to Tom, git traffic is up, plus oe.org source mirror contributes to network traffic
  ** Also autobuilders doing regression testing on Angstrom and oe-core - cpu/disk load
* Estimate the amount of financial contribution to OSUOSL
  ** Still under discussion, Tom suggesting around $300-$500 per year?
  ** to offset the free hosting and bandwidth...
* Tom estimates to have 4-8 physical servers for OE in the near future

07) financial support from LF/Yocto
* LF is already supporting OE
  ** server donation
  ** sponsoring Tom's travel to the site for admin work
  ** offering travel sponsorship to key OE people for big events?
* some OE community members are suggesting that Yocto should provide additional financial support to OE
  ** to help with OE's ongoing expenses
  ** to support oe-core/meta-oe development, hosting and regression testing
  ** not talking about big money though

08) agree on next Board meeting
* next meeting is either Aug 8-12 or short one the last week of July for financial updates
* need to start fomalizing the budget and concrete financial goals

09) anyone attending CCC?
* http://events.ccc.de/camp/2011
* http://en.wikipedia.org/wiki/Chaos_Communication_Camp



