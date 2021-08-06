Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4663.1628256507817406793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 915E5240004;
	Fri,  6 Aug 2021 13:28:25 +0000 (UTC)
Cc: openembedded-core@lists.openembedded.org,
 "Yurkov, Vyacheslav" <Vyacheslav.Yurkov@bruker.com>
Subject: Re: [OE-core] [PATCH v4 2/7] overlayfs.bbclass: generate overlayfs mount units
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
 <20210806120611.124246-2-uvv.mail@gmail.com>
 <ac780428-cee9-c5b0-bec5-4e7578950c0b@bootlin.com>
 <8f124922d571cd303cc2a6f312e8c1168b53573e.camel@linuxfoundation.org>
 <CAKHfEagxHcZUjjKjMztBRuGRpvCUpTyuVWQ_TgTA7_HYj7Ppfw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <79eecae4-ebb2-d21f-3ddc-25139b9a2ca4@bootlin.com>
Date: Fri, 6 Aug 2021 15:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKHfEagxHcZUjjKjMztBRuGRpvCUpTyuVWQ_TgTA7_HYj7Ppfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/6/21 3:13 PM, Vyacheslav Yurkov wrote:
> I've already updated the docs and will submit the patch as soon as
> this series is approved and merged.


Fantastic. Many thanks :)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

