Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsvGx-00005I-2E for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 14:00:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09CjX7D029369;
	Wed, 9 Jan 2013 12:45:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23407-03; Wed,  9 Jan 2013 12:45:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09CjMJl029362
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 9 Jan 2013 12:45:24 GMT
Message-ID: <1357735525.13022.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Date: Wed, 09 Jan 2013 12:45:25 +0000
In-Reply-To: <50ED302A.1080601@oss.bmw-carit.de>
References: <50ED2BAD.5030405@oss.bmw-carit.de>
	<CAF6bG8cLVGAyphd=pk7T5eF8LS=BXb7+fy7uOyUzwBHSPKJxvg@mail.gmail.com>
	<50ED302A.1080601@oss.bmw-carit.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problems with sending patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 13:00:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-09 at 09:54 +0100, Lukas Bulwahn wrote:
> On 01/09/2013 09:50 AM, Marko Lindqvist wrote:
> > On 9 January 2013 10:34, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> >> Hi,
> >>
> >> I have been repeated trying to send a patch to this mailing list, but it
> >> seems that it never appears here.
> >> I have checked the commit extensively for some problem, I tried different
> >> ways of sending with format-patch and thunderbird, and git-send-email.
> >> And I have checked our mail server. However, none of these options helped.
> >>
> >> I have sent patches some weeks ago already, that's why I am surprised that
> >> it does not work anymore.
> >> Has something been changed lately for sending patches on the mailing list?
> >>
> >> Any pointers are welcome.
> >   Looking my inbox, I've received at least three times this patch from you:
> > [PATCH] site/common: deactivate a runtime check for ipv6-support in,
> > python >=2.7.1 that fails when cross-compiling
> >
> >   If you still don't see them yourself, your end is probably just
> > noticing that you have sent them yourself and they should not be
> > displayed as incoming.
> >
> Thanks for your response. I did not expect my end to be that intelligent.

There is an option in mailman's config where you elect to get your own
emails to the mailing list or not. It sounds like you've elected not to.

An easy way to check if an email has got to the list is to use the
mailing list archives:

http://lists.linuxtogo.org/pipermail/openembedded-core/

Cheers,

Richard



