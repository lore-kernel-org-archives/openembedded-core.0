Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RE0qB-0004Qs-2N for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 17:35:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RE0ke-00089f-3k for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 17:29:48 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 17:29:48 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 17:29:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 12 Oct 2011 17:29:24 +0200
Message-ID: <j74bok$nbr$1@dough.gmane.org>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<j73ifb$3kl$1@dough.gmane.org>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
	<CAMKF1srW_j_H1EKJvs9LMOcFeXauLbK5_9W7jcr2RjTtN5OeQQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <CAMKF1srW_j_H1EKJvs9LMOcFeXauLbK5_9W7jcr2RjTtN5OeQQ@mail.gmail.com>
X-Enigmail-Version: 1.3.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 15:35:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 17:22, Khem Raj schreef:
> On Wed, Oct 12, 2011 at 8:18 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> 
>> Op 12 okt. 2011, om 17:16 heeft Khem Raj het volgende geschreven:
>> 
>>> On Wed, Oct 12, 2011 at 1:17 AM, Koen Kooi
>>> <koen@dominion.thruhere.net> wrote:
> Op 11-10-11 21:11, Cliff Brake schreef:
>>>>>> Hi, we are moving git.openembedded.org to a new server.
>>>>>> 
>>>>>> SSH access on the old server has been disabled.  git:// still
>>>>>> works there.
>>>>>> 
>>>>>> As soon as DNS propagates, SSH access will work with the new
>>>>>> server.
>>>>>> 
>>>>>> Let me know if you see any problems.
> 
> When will cgit be back up?
>>>> 
>>>> It should be up already. Do Ctrl+f5 in your browser on
>>>> git.openembedded.org
>>> 
>>> Let me rephrase: when will it be working again? I still get "No
>>> repositories found" when clicking on a repo.
> 
>> Weird I see all the repos fine.

Old: http://cgit.openembedded.org/cgit.cgi/openembedded-core/log/?h=master-next

New: http://cgit.openembedded.org/openembedded-core/log/?h=master-next

So the URLs changed :(

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlbJUMkyGM64RGpERAu24AKClgYvg645M1A7QDsFwqqI2nitZvgCfYUJe
xCOhSnarP1PELO3WyrhOSQg=
=6oZd
-----END PGP SIGNATURE-----



