Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.36105.1628858917263328889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 05:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 534BF200008;
	Fri, 13 Aug 2021 12:48:35 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 3/3] docs: update docs with new tune locations
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20210810214503.17791-1-jdmason@kudzu.us>
 <20210810214503.17791-4-jdmason@kudzu.us>
 <169A389D543FF76C.17558@lists.openembedded.org>
 <38d0eba3-72b2-b85b-674f-79dad2997761@bootlin.com>
Organization: Bootlin
Message-ID: <7b8ffe67-69e3-7da7-919e-63f93d8f9305@bootlin.com>
Date: Fri, 13 Aug 2021 14:48:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <38d0eba3-72b2-b85b-674f-79dad2997761@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/13/21 12:03 PM, Michael Opdenacker wrote:
> Hi Jon,
>
> On 8/11/21 12:07 PM, Michael Opdenacker wrote:
>> Thanks for the patch!
>> Indeed, I believe that moving all arm includes to a specific directory
>> would be more consistent, but that's just from the perspective of
>> someone looking at the source repositories. I don't know how much
>> trouble the big change would cause.
>>
>> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Merged into yocto-docs master-next. Thanks again!
> Michael.

Eventually, removing it from master-next for the moment, waiting for the
code updates first.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

