Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RSv4o-0007Jh-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:28:14 +0100
Received: by bkbzs2 with SMTP id zs2so545040bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:21:40 -0800 (PST)
Received: by 10.205.128.15 with SMTP id hc15mr19806323bkc.110.1321986099771;
	Tue, 22 Nov 2011 10:21:39 -0800 (PST)
Received: from [9.152.224.38] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id l18sm19471392fab.9.2011.11.22.10.21.38
	(version=SSLv3 cipher=OTHER); Tue, 22 Nov 2011 10:21:38 -0800 (PST)
Message-ID: <4ECBE831.3020407@linaro.org>
Date: Tue, 22 Nov 2011 19:21:37 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ECBE307.1080600@linaro.org>
	<5C583370-13B0-49CD-B3C0-BB4DC3F223A2@dominion.thruhere.net>
	<2419769.NUvRBCfOV2@helios>
	<F5582724-3A62-4B8A-8575-686FD03C2AA3@dominion.thruhere.net>
In-Reply-To: <F5582724-3A62-4B8A-8575-686FD03C2AA3@dominion.thruhere.net>
Subject: Re: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Tue, 22 Nov 2011 18:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 07:17 PM, Koen Kooi wrote:
>
> Op 22 nov. 2011, om 19:08 heeft Paul Eggleton het volgende geschreven:
>
>> On Tuesday 22 November 2011 19:02:55 Koen Kooi wrote:
>>> You do know that the gcc 4.6 in OE-core and gcc 4.5 in meta-oe already have
>>> all the linaro patches (minus the ones that introduces bugs), right?
>>
>> How would one find that out? I mean, without looking at every patch we have in
>> our toolchain...
>
> We have been pointing out that fact to various linaro people the past month, most recently at ELC-E and Linaro Connect. If for some reason that hasn't come accross, a 'git grep linaro' would have given you a big clue :)

Unfortunately I wasn't able to attend these events. :/
I'll check with some of the people who went there.
Sorry for the noise.

Ken


