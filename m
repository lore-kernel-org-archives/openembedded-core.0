Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.34602.1628849026012133917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 03:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0A1F8E000A;
	Fri, 13 Aug 2021 10:03:43 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 3/3] docs: update docs with new tune locations
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20210810214503.17791-1-jdmason@kudzu.us>
 <20210810214503.17791-4-jdmason@kudzu.us>
 <169A389D543FF76C.17558@lists.openembedded.org>
Organization: Bootlin
Message-ID: <38d0eba3-72b2-b85b-674f-79dad2997761@bootlin.com>
Date: Fri, 13 Aug 2021 12:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <169A389D543FF76C.17558@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Jon,

On 8/11/21 12:07 PM, Michael Opdenacker wrote:
>
> Thanks for the patch!
> Indeed, I believe that moving all arm includes to a specific directory
> would be more consistent, but that's just from the perspective of
> someone looking at the source repositories. I don't know how much
> trouble the big change would cause.
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Merged into yocto-docs master-next. Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

