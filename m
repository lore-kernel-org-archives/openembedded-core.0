Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UPAIa-0003Rz-1U
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 13:31:52 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id B02CB20896
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2013 13:14:27 +0200 (CEST)
Message-ID: <5162A697.6080705@pseudoterminal.org>
Date: Mon, 08 Apr 2013 13:14:31 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5162038C.2020706@pseudoterminal.org>
	<CAJTo0LbOMz+MninSBv6d8UjeQ3cJMn-WXfq1v5Cqu4npDh+eng@mail.gmail.com>
	<2ED8DCD8-2873-4DE1-85C2-5CB254B8FD58@dominion.thruhere.net>
	<1580357.lcDe81vJOD@helios>
In-Reply-To: <1580357.lcDe81vJOD@helios>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 11:31:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-08 13:09, Paul Eggleton wrote:
>
> Returning to the original topic, a case could be made for just bringing orc
> and libav into OE-Core. That's not going to work for every situation but we
> ought to be looking at these kind of things on a case-by-case basis.
>   
> Cheers,
> Paul
>

You should add yasm to that list. libav isn't happy without it ;)

Carlos


