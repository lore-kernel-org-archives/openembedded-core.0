Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SILJM-0007gb-Ae
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:47:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6792B315B11C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 16:38:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id uHqEVIv+VYVf
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 16:38:19 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c5060.pool.mediaWays.net [89.12.80.96])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DCCC2315B112
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 16:38:18 +0200 (CEST)
Message-ID: <4F86E8D9.30608@opendreambox.org>
Date: Thu, 12 Apr 2012 16:38:17 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
	<2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
	<4F86E3FF.3050905@communistcode.co.uk>
In-Reply-To: <4F86E3FF.3050905@communistcode.co.uk>
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 14:47:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.04.2012 16:17, Jack Mitchell wrote:
> On 12/04/12 15:08, Koen Kooi wrote:
>> Op 12 apr. 2012, om 15:42 heeft ml@communistcode.co.uk het volgende
>> geschreven:
>>
>>> From: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>>
>>> Signed-off-by: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>> ---
>>> meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
>>> meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++

    ^^^^^^^

>> I'll ask the standard question: why is this needed in oe-core?
>>
>> regards,
>>
>> Koen

I think there's a misunderstanding. Jack sent the patch to the wrong list.

Jack, patches for meta-oe should be submitted to
openembedded-devel@lists.openembedded.org, with [meta-oe] as part of the
subject. See http://www.openembedded.org/wiki/Mailing_lists.

Regards,
Andreas


