Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0F02F6BE9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 22:17:38 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so1419405oag.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gYDTj/VlO3IML7tjg7064jBgz265di92xkH5PNnmiyo=;
	b=EMIovrQDO4xiG5nQWTxEg43A8rtHJkg5mA27U5aMUree5f85Tvi+EVUxDx1cpWO8fE
	P63q3sYOI7sXaCj64E4/Ch+Y+dG8/Teko2Vxb2/0b3KGiH9Y+kjXFyy/fqiCKgpgb0Pc
	S/sjenxnPVoL+ZCYl2wftkjIgMebzUbtxzn0xC6iGuC9wMof/7LN2Z64Lfv8JLaZ2nF3
	uSYLrx4J5CumGLNLJuZoLHAuwxl61VDJIwzSFnHLNLHjP/po6vJMY5/kg1Fngwcn2RF6
	pyUvp0OJic3gP16JLkQndQC08b/90YOK1Gq8wnhSDR3BrIIApme0rG5WcGGzZCaTQ0Pa
	lZFQ==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr4276368obx.89.1377814659445; Thu,
	29 Aug 2013 15:17:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 29 Aug 2013 15:17:39 -0700 (PDT)
In-Reply-To: <521B9AD8.6060400@linux.intel.com>
References: <CAOMwXhPL4J8irv+8t02Mck-vAH47+9rqvncEkCUZpPHZWdSz1g@mail.gmail.com>
	<521B9AD8.6060400@linux.intel.com>
Date: Thu, 29 Aug 2013 19:17:39 -0300
X-Google-Sender-Auth: A5pxHp2W7K2fXDRmrfCG9UU1iK0
Message-ID: <CAP9ODKr+owgKVxzegkJ+FrQepcDRF1Qw08K5YUSMOFxc-h2pAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07 - Beagleboard XM Issue?
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
X-List-Received-Date: Thu, 29 Aug 2013 22:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 26, 2013 at 3:13 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/26/2013 11:06 AM, Laszlo Papp wrote:
>>
>> On Mon, Aug 26, 2013 at 7:04 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     On 08/26/2013 10:56 AM, Laszlo Papp wrote:
>>
>>         What exactly is the problem for beagle board?
>>
>>     The QA team did not provide the details.
>>
>>
>> I wonder if you could ask for that?
>
>
> Yi,
>
> Can you be specific about the Beagleboard XM issue.

I'd  be interested in learn from it as well and fix it. So we can drop
other recipes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

