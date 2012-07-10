Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoPLU-0002uA-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 03:34:32 +0200
Received: by eaal1 with SMTP id l1so4249793eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 18:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jXk+VwwJfGXb8dCYfwMTXIxb/e40pMQ7LexrrVgmeXM=;
	b=WSafTJSdysRtOWKepj/v5yDQx506ZndlO7wNI1xWT/mimb7/VeJLVi6BrkEZxg9O3I
	ctstefjdXmkzVQglkUjxoH7l0c7NL7E7e+OdyJMmEQ3cm9QSkwNZMNPOvmEyTkchm9hf
	Jhe4Xd5mk4O/iTgbk/UUZMIN6SUNqAnNVObXWIKtDa8ZujnTx6fthoINN56EsYtWqO81
	6bm/h3xiIil9ADmbcfSV+BP21SAj1VXgPGjKJizhd4XShcYnO6eXHtDbDMmNrg7+wN+k
	+K7LF5ZagWuXTAjRuivtXcxYJZVqj9h2xKKZxvsb8h5VtztA4R7XnAPK/BEk+xRd3pvR
	fqeQ==
Received: by 10.14.95.138 with SMTP id p10mr10296127eef.110.1341883402590;
	Mon, 09 Jul 2012 18:23:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 18:22:52 -0700 (PDT)
In-Reply-To: <4FFB6344.80708@se-eng.com>
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
	<CAMKF1sqpZtYyb4qCjFJu1Scb_J3KsvoX+UXkWC57bS_KgwAKOw@mail.gmail.com>
	<4FFB6344.80708@se-eng.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 18:22:52 -0700
Message-ID: <CAMKF1soqQwf5mb5usNo1pUeoikNwfJKhQcJ2L66HKwaUQSzogg@mail.gmail.com>
To: ray.danks@se-eng.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkelfimage: Upgrade to e1e6a91
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
X-List-Received-Date: Tue, 10 Jul 2012 01:34:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 4:03 PM, Raymond Danks <ray.danks@se-eng.com> wrote:
> On 07/09/2012 04:41 PM, Khem Raj wrote:
>>
>> On Mon, Jul 9, 2012 at 1:51 PM, Raymond Danks<ray.danks@se-eng.com>
>> wrote:
>>>
>>> Packaging issues resolved with latest version from git.
>>
>> which packaging issues ? can you add more context here please.
>
> Raj,
>
> This is in response to Saul's make world test on x86 from last night.  See
> the thread entitled [PATCH 2/2] mkelfimage: Add stable git build (initial
> recipe).
>
> The patch merged into to coreboot is here:
> http://review.coreboot.org/#/c/1195/
>
> This patch is the same revision as the revision specified in the .bb file.

you can add that bit of info to commit log

>
> Thanks,
> Ray
>
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


