Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RSuyY-00058s-3G
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:21:47 +0100
Received: by bkbzs2 with SMTP id zs2so537741bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:15:13 -0800 (PST)
Received: by 10.205.139.65 with SMTP id iv1mr7845578bkc.34.1321985713310;
	Tue, 22 Nov 2011 10:15:13 -0800 (PST)
Received: from [9.152.224.38] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id k26sm19457682fab.8.2011.11.22.10.15.12
	(version=SSLv3 cipher=OTHER); Tue, 22 Nov 2011 10:15:12 -0800 (PST)
Message-ID: <4ECBE6AF.6010700@linaro.org>
Date: Tue, 22 Nov 2011 19:15:11 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ECBE307.1080600@linaro.org>
	<5C583370-13B0-49CD-B3C0-BB4DC3F223A2@dominion.thruhere.net>
In-Reply-To: <5C583370-13B0-49CD-B3C0-BB4DC3F223A2@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 22 Nov 2011 18:21:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 07:02 PM, Koen Kooi wrote:
>
> Op 22 nov. 2011, om 18:59 heeft Ken Werner het volgende geschreven:
>
>> Hi,
>>
>> I'm currently reading the OpenEmbedded User Manual and wondering what's the best way to add a layer for the Linaro toolchain components
>
> You do know that the gcc 4.6 in OE-core and gcc 4.5 in meta-oe already have all the linaro patches (minus the ones that introduces bugs), right?

Oh, I didn't know that - thanks for the heads up. The patches your are 
referring to are among meta/recipes-devtools/gcc/gcc-4.6/*patch, right? 
In this case I guess I'll discuss with the Linaro team on how to proceed 
first. :)

Regards
Ken


