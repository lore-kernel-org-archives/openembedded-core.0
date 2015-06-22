Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 4CC7A65C63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 21:58:59 +0000 (UTC)
Received: (qmail 14756 invoked by uid 1003); 22 Jun 2015 21:59:00 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.110.39)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Jun 2015 21:59:00 -0000
Message-ID: <55888523.8090203@balister.org>
Date: Mon, 22 Jun 2015 17:58:59 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Florian Boor <florian.boor@kernelconcepts.de>, 
	openembedded-core@lists.openembedded.org
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
	<558882AB.2060703@kernelconcepts.de>
In-Reply-To: <558882AB.2060703@kernelconcepts.de>
Subject: Re: Future of Qt4 recipes
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
X-List-Received-Date: Mon, 22 Jun 2015 21:59:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06/22/2015 05:48 PM, Florian Boor wrote:
> Hi,
> 
> Am 22.06.2015 um 12:43 schrieb Burton, Ross:
>> 1) There's still lots of people using Qt4 in production, please keep it in
>> oe-core!  (and revisit in six months time)
> 
> I agree it is really widely used in production. I would leave it in as long as
> the situation stays like this and Qt4 is maintained.

I tend to agree with Florian here, qt4 is widely used, and we shouldn't
drop it until it goes unsupported.

That said, it will be unsupported before the next release goes unsupported.

Tough call.

Philip


> 
> You know in my opinion we would be better with a little bit less fragmentation...
> 
> Greetings
> 
> Florian
> 

