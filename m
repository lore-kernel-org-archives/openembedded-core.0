Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA8D60673
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 08:31:22 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id z11so3656550lbi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 00:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xSdNwWpI+9ykQ4RKKtyIeSawBK25kUVJ4iauz6z7feI=;
	b=jOXoqnzSfycjIjnxA2Y/Z8mkjXM+BQpkd3eSj1vBHKu4XDmzhHo3PWUBS7lfWmYA0K
	3MS5W8zh4WyGwbG9Y29Kd/SIMlPQZqWLlnllEvI8UT0tE1MJZeyge/j5DjP6qLtRFo+w
	Zn+9231ardt40IBXRVznyL2YDFPJUxWKOhV6BHUfG3V/Jf/FvUaPImxVgCICt+OEzKY5
	fLp3SXwZexv1QsV/qXi7KpG1h2kc4mWzu7xxqULfJggOPv3ZY7jV3fYX/sz7c/R0qvlP
	5iYL5MFqnJnWiwBEtNz+y9E9BXw3zd9UduLERtDZUFMwtWwcCNZEhUAf5YSQ79PnlozW
	pznQ==
MIME-Version: 1.0
X-Received: by 10.152.36.165 with SMTP id r5mr8262448laj.93.1418286681558;
	Thu, 11 Dec 2014 00:31:21 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 11 Dec 2014 00:31:21 -0800 (PST)
In-Reply-To: <CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0LaGa3ACsL+vLjzUDgEQDDxJ2L2m1WQgj1LHdbzpsJPLUg@mail.gmail.com>
Date: Thu, 11 Dec 2014 03:31:21 -0500
Message-ID: <CADkTA4P0XMtSxKop9vqr6SbS8KBmaGuZfKFs7Ej0CsDcqLt4DQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 0/9] kernel: version updates
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
X-List-Received-Date: Thu, 11 Dec 2014 08:31:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 10:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 December 2014 at 14:16, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
>>
>> The following changes since commit
>> 88dfcbf149dda89277e58ae4ec3a87500624cfff:
>>
>>   kernel-yocto: make sure git tags get dereferenced properly in do_patch()
>> (2014-12-10 08:12:56 -0500)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib HEAD
>
>
> I wonder what happened here!

@#!$#@$ the script is insane.

>
>>
>> for you to fetch changes up to 4be985be419f06f18c735d72ac4a4d00fea71dd8:
>>
>>   linux-yocto/3.14: update to 3.14.26, integrate ltsi and -rt updates
>> (2014-12-10 08:38:49 -0500)
>
>
> That's zedd/kernel-updates, right?
>

Yah. Sorry about the confusion,

Bruce

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

