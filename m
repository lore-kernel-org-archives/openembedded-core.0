Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qnz0d-0005SP-Iu
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 22:22:43 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QnywQ-00015z-PH from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 13:18:22 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 1 Aug 2011 13:15:07 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 1 Aug 2011 13:18:22 -0700
Message-ID: <4E3709FF.4090904@mentor.com>
Date: Mon, 1 Aug 2011 13:18:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312206333.2344.456.camel@rex> <4E36FDA2.7030001@mentor.com>
	<1312228607.2344.526.camel@rex>
In-Reply-To: <1312228607.2344.526.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Aug 2011 20:15:07.0827 (UTC)
	FILETIME=[B53B4830:01CC5087]
Subject: Re: Commits to master in my absence
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
X-List-Received-Date: Mon, 01 Aug 2011 20:22:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/01/2011 12:56 PM, Richard Purdie wrote:
> On Mon, 2011-08-01 at 12:25 -0700, Tom Rini wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 08/01/2011 06:45 AM, Richard Purdie wrote:
>>
>>> I'm a little frustrated to see what happened when I was away from a
>>> couple of days. I thought we'd agreed we'd queue up patches in a branch
>>> and then I'd take care of things when I got back.
>>
>> So, I agree with everything you did say.  But I'd also like to suggest
>> we should have gone with "merge everything Monday" not "merge everything
>> Wednesday before RP runs off".  Yes, this would have meant either moving
>> some testing, or having testing also pull from a different (merged)
>> branch.  And I too was "wait, what, more stuff went in?  I thought we
>> caught the big problem already".
> 
> If I'd merged everything unexpectedly and not communicated the situation
> I think that would be bad. As it was, I did merge things but I also
> hopefully clearly communicated the issues and the expectation. Master is
> the development tip and some instability, particularly as new features
> merge is not entirely unexpected at this point in the cycle.
> 
> I'd hope we don't end up in a situation like that again, if we do, I'll
> see what other options there and weigh them up as the situation
> dictates.

Yes, it was an intentional and communicated decision.  I guess what my
gut says right now is that while some folks are willing to live with
some "it's broken, try again in a few days or go back to ...", a lot of
the community expects things to be mostly working, and there was also
some "ok, I want to expand / use this stuff, but..." that we ran into,
which really is situation dependent.  And yes, next time we will need to
weigh the options once again.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJONwn7AAoJEI4NMjfc3nJx2vQH/2u2MKHdqhsHNfoZoHlhPCJQ
jk144kwp69HHVS9gKjiJCf1fkum9MTblT5V5VDIYgoD2yHDBnCe/P/9GWS8rlTcq
lUweqPMDuWvoWPEGRWnNLPAnXP+bsWqoQLGEUuHkcmMag4yJsJSZYTmU6btTOSNa
ON6Q4RnkTcD08AiHark/R5YHS46HaQ6tVyRpK3DgMUgfGVGnYa0EFzGG73p6q44x
GKsXqNRverf4uu9KbnRTcciuxeIytGlZ3ewT9yHJBcKOjaT9a8FEkA03fHOIqRy/
VJnfjOL4NbdoSRa67INQm8nAnI20WzxCrkzZPJ/2+VXXCfrZ4TFiabUviocPpmA=
=oTtt
-----END PGP SIGNATURE-----


