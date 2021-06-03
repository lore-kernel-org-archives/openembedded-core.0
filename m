Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.1164.1622737188498915362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 09:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1B77F200007;
	Thu,  3 Jun 2021 16:19:45 +0000 (UTC)
Cc: Steve Sakoman <steve@sakoman.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [hardknott] [PATCH 1/5] expat: set CVE_PRODUCT
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
 <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
 <dc93923039b634c48ab47fbd5b09f93ba1fae8cf.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <996e160e-8ff0-2bc0-5328-62d014d3e1ae@bootlin.com>
Date: Thu, 3 Jun 2021 18:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dc93923039b634c48ab47fbd5b09f93ba1fae8cf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 6/3/21 12:36 AM, Richard Purdie wrote:
>> Oops, this variable doesn't appear in the documentation and more
>> generally CVE management doesn't seem to be documented.
>>
>> Your comments and suggestions are welcome. I created a new bug
>> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=14419) to track this.
> It isn't documented and should be. Having the bug is good and we should 
> fix/improve this.


Great, thanks for confirming this!
Cheers,
Michael.

>
> Cheers,
>
> Richard
>
>
> 
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

