Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuZjn-0004RS-UK
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 01:16:20 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuZiO-0006lm-An from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Mar 2011 16:14:52 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 1 Mar 2011 16:14:52 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 1 Mar 2011 16:14:52 -0800
Message-ID: <4D6D8BE8.9020907@mentor.com>
Date: Tue, 1 Mar 2011 17:14:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>	<A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>
	<4D6D5671.6050903@windriver.com>
In-Reply-To: <4D6D5671.6050903@windriver.com>
X-OriginalArrivalTime: 02 Mar 2011 00:14:52.0141 (UTC)
	FILETIME=[D9BFA9D0:01CBD86E]
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 02 Mar 2011 00:16:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2011 01:26 PM, Mark Hatle wrote:
> On 3/1/11 1:55 PM, Koen Kooi wrote:
>> ping
>
> Do you have an example showing how this is to be used?

For example:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine/include/omap3.inc
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap3.inc

-- 
Tom Rini
Mentor Graphics Corporation


