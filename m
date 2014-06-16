Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id AD99A6FADB;
	Mon, 16 Jun 2014 09:45:16 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id E45D8E012A;
	Mon, 16 Jun 2014 11:45:16 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id D9E95700D67;
	Mon, 16 Jun 2014 11:45:15 +0200 (CEST)
Message-ID: <539EBCA8.3000709@dresearch-fe.de>
Date: Mon, 16 Jun 2014 11:45:12 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 09:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 16.06.2014 10:48, Paul Eggleton wrote:
> On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
>> What is the right ML address for patches in this area?
>>
>> The meta-multimedia/README in git://git.openembedded.org/meta-openembedded
>> (daisy branch) says:
>>
>>   "Send pull requests to openembedded-devel@lists.openembedded.org"
>>
>> But i believe this should be openembedded-core@lists.openembedded.org.
> 
> No, for all layers in the meta-openembedded repository it should be 
> openembedded-devel as listed.

OK, thx for this info.

So i hope the patch will make it into the daisy branch in the next time, because our build is broken meanwhile (OK, we have a workaround, but this is unendearing).

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

