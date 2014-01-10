Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 72063601AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 16:02:58 +0000 (UTC)
Received: (qmail 10150 invoked by uid 1003); 10 Jan 2014 16:02:59 -0000
Received: from unknown (HELO ?10.8.0.6?) (philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Jan 2014 16:02:58 -0000
Message-ID: <52D019B1.6090905@balister.org>
Date: Fri, 10 Jan 2014 11:02:57 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>
References: <52CEEE43.1090209@linaro.org> <36564971.Qsvan2fIrZ@helios>
	<52D01717.605@linaro.org>
In-Reply-To: <52D01717.605@linaro.org>
X-Enigmail-Version: 1.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 16:02:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/10/2014 10:51 AM, Trevor Woerner wrote:
> Hi Paul,
> 
> On 01/10/14 09:01, Paul Eggleton wrote:
>> This is all very interesting with people piping up that their layers
>> are maintained, but I'm not sure it helps solve the overall problem.
> 
>> Also, if it does appear that a layer has gone "unmaintained" by
>> popular consensus, what should actually be done about it? 
> 
> I was hoping I could put together a list of the layers which are no
> longer maintained to see if we could find people who might be interested
> in stepping up and taking on their maintenance. Or at the very least,
> clarifying a given layers' maintenance status.
> 
> At the last OE TSC meeting the issue of unmaintained layers was brought
> up, I asked several times if people could specify to which layers they
> were referring, but nobody replied. So people are concerned about layers
> that have no maintainer, but nobody can say which ones (?). In my
> opinion I thought it would be easier to solve this problem if we could
> at least start by defining it.

BTW, I maintain meta-sdr.

Philip

> 
> As to what can be done about it: if a layer is not maintained, and
> nobody cares for the layer, we should drop it from the list or at least
> mark it as such ("buyer beware"). If a layer is not maintained, and
> people do care, then we'll need to try to find someone to take
> responsibility for it (we should, at the very least, make the attempt).
> Also I think we should identify layers that people do care about, whose
> maintenance is questionable, which are not hosted in a way where the
> community can apply necessary patches to easily.
> 
> Best regards,
>     Trevor
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

