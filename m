Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3D0619DE;
	Thu, 27 Jun 2013 15:38:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5RFjVtK023022; Thu, 27 Jun 2013 16:45:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yYqNTYpZ7UX4; Thu, 27 Jun 2013 16:45:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5RFjSa4023014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 27 Jun 2013 16:45:29 +0100
Message-ID: <1372347506.9930.220.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-members@lists.openembedded.org
Date: Thu, 27 Jun 2013 16:38:26 +0100
In-Reply-To: <51CC50B4.6060703@balister.org>
References: <1371572589.20823.143.camel@ted> <51CC50B4.6060703@balister.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: tsc <tsc@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE, the TSC and the future
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2013 15:38:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-27 at 10:48 -0400, Philip Balister wrote:
> On 06/18/2013 12:23 PM, Richard Purdie wrote:
> > I should note that whilst I did take an action from the TSC to start a
> > discussion and that the TSC does have some ideas in mind, I'm primarily
> > expressing personal views here, not those of the TSC. Other TSC members
> > are more than capable of expressing their own views!
> 
> OpenEmbedded still needs a group of people to provide technical
> leadership that are appointed/elected by the technical people active in
> the project. How the TSC provides this leadership is up to them.

Agreed, I still think there is a role for the TSC there, the time is
just right to think about how it works and whether everything makes
sense.

> I'd like to see the TSC interact more with the larger community and be
> less focused on meetings. As the OE board chair, I am fine with having
> us chase infrastructure issues and letting the TSC focus on improving
> OpenEmbedded.
> 
> My challenge to the TSC is how can we improve the community of people
> working on OpenEmbedded. Engaging with the Yocto Project has brought in
> large numbers of new developers and I feel we have done a poor job
> integrating them into the larger OpenEmbedded community.

Personally, I don't see a split between OE and YP communities. Anyone
submitting changes to OE-Core joins the OE-Core mailing list and becomes
part of the OE community.

I do wonder/worry whether we do get people involved into any of the
projects as much as we could/should though. There aren't that many new
faces taking ownership of areas of the codebase for example. We have
gone to a lot of effort to try and make many things "just work", perhaps
this is partly a result of that? It would be both a good and bad thing
in that case!

> I had hoped at one point we could use the Collab Summit for developer
> meetings, like the old OEDEM (Open Embedded Developer European Meeting)
> we had in the past. But the vibe there is all wrong and attendance is by
> invite. Also the US West coast location is very painful for people from
> Europe. (Mind you, Europe is painful for the US West Coast :)
> 
> To give you an idea to kick around, we need to create some form of event
> that corporate types can convince their managers is valuable to attend,
> while avoiding the typical conference mode of people presenting to rooms
> of people. My goal for such an event is have developers and the user
> community exchanging ideas with high bandwidth channels. As opposed to
> IRC, EMail, and telecons we normally use. (We make good use of these
> tools, they each have limitations though)
> 
> The word I have seen kicked around is "Unconference".

I think the key here is to find someone interested in holding this event
and that person making it happen. There are people around who could help
but I think it would need someone from the OE community to step up and
own it.

> Like I said earlier, how the TSC achieves its mission is up to them.
> Both of these suggestions looks sane. Having meetings for the sake of
> having a meeting is not good.

Agreed, I don't think the TSC has reached that point however there is a
need for wider involvement of others in the community. I can only take
silence in reply to my email as agreement although that makes it hard to
tell :/.

> The TSC is free to call on people as they see fit, however I would
> expect any selection process to be very transparent and open to all
> interested participants. Maybe a good first step would be document who
> is doing what. It would be nice to have a web page on the wiki defining
> layer maintainers, branch maintainers, active autobuilders etc. I know
> all this is in readme;s etc, but having a central index of active people
> would be really helpful to show people the extent of the OpenEmbedded
> community.

Who is going to do it? The information is all there, its perfectly
possible. I'd like to see new faces involved though, the existing TSC
members and board members do enough already. Much as I want to help with
many different things, I don't scale and the usual suspects aren't going
to either indefinitely :/.

Cheers,

Richard



