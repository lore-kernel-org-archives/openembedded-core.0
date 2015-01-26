Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id E1BC160670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 17:17:36 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 79so4320026ykr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 09:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EvoaId3gvrnz+oN9dJzenFOSXlQ5IWDCfBXzXyTPKpg=;
	b=vLACYXZnhZozVp7wRwhlBdjhzXvnWpYfO5hP6d1CQJPrk01yFjIre8LFUMZUGJaa+K
	DLPoyIfC/gZigQcfyqQ6W1LO1arfT6owDJiupdi4c2eiBwApFPcOynT4oJM/0oF3CT80
	scZQMNxf6Pufn/ZtqZOfejECVRjU2EPEmS/LzzUDV3vFLh39qOyxdr6YT6mNJXdjqkC9
	Z3AEY9J2VEqEeMnJVxwEL1dh3dTFyp0OjDMBpMTpJx2hLLUeGNNocgTdA7SJ7TiGvxsa
	hGb6qdthCZKY4dxCCeizh4wZYckDd//FfUETUyk5rQOp8oeeVYDPxNe2F7ALyz6ecsO6
	zKVg==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr9825608yho.104.1422292655725;
	Mon, 26 Jan 2015 09:17:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Mon, 26 Jan 2015 09:17:35 -0800 (PST)
In-Reply-To: <CAJTo0Lb7rh6qxR4jeOK9GcYfcMKc-1wzQGKU_QF3Q=vY_d+vuw@mail.gmail.com>
References: <1422052818-3276-1-git-send-email-denis@denix.org>
	<20150126171355.GE28747@denix.org>
	<CAJTo0Lb7rh6qxR4jeOK9GcYfcMKc-1wzQGKU_QF3Q=vY_d+vuw@mail.gmail.com>
Date: Mon, 26 Jan 2015 15:17:35 -0200
X-Google-Sender-Auth: Wrld0c7W2plvj_k9Y8h_Pk6XWaM
Message-ID: <CAP9ODKprPtOjGDHWL72_S4zsj5rSFUvyZ2pxifF=QGU5PW92YA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Mon, 26 Jan 2015 17:17:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 26, 2015 at 3:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 26 January 2015 at 17:13, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> Any feedback so far?
>
>
> Builds for me for beaglebone, totally untested.  An ack from Otavio would be
> greatly appreciated :)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

