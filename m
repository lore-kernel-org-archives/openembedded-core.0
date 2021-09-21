Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1049.1632244347052501825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 492CE2000E;
	Tue, 21 Sep 2021 17:12:25 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] documentation: update sources mirror URL
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20210920195139.26235-1-jdmason@kudzu.us>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b8e1be5a-d0de-4a55-10c8-0f0a0c245bd4@bootlin.com>
Date: Tue, 21 Sep 2021 19:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920195139.26235-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Jon,

On 9/20/21 9:51 PM, Jon Mason wrote:
> The URL for the sources mirror no longer works.  Update to the new
> location.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  .../bitbake-user-manual-ref-variables.rst         |  8 ++++----
>  documentation/ref-manual/faq.rst                  | 15 ++++++++-------
>  documentation/ref-manual/variables.rst            |  8 ++++----
>  3 files changed, 16 insertions(+), 15 deletions(-)


Shouldn't you send this patch to the bitbake-devel mailing list instead?

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

