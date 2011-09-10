Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2V4q-000762-Ub
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 23:27:05 +0200
Received: by yia28 with SMTP id 28so1662325yia.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 14:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=XdPteaozO6MlUivbdKFxwP8FZH9GqDHqnZYuRUV1BhM=;
	b=Vm1rHWuy2UPsooMrV7qUBEXzRlHJhrRz+9p5dBZ5NCMWrIobdb36glxDbzMfN0yz3j
	hlXPEhaI+tBnqzwD3rZ7m0cIZF8HRm0ILdcxw0jjIarxqsZMuNajtrQHaHegjy+VGT3u
	PCtfMr36siBTTFoxrryTqoQ+6kNUdRIheF5dE=
MIME-Version: 1.0
Received: by 10.236.179.72 with SMTP id g48mr19631699yhm.50.1315689715140;
	Sat, 10 Sep 2011 14:21:55 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.236.111.35 with HTTP; Sat, 10 Sep 2011 14:21:55 -0700 (PDT)
In-Reply-To: <20110910204621.GC5456@jama.jama.net>
References: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
	<4E6BA2E2.7090301@eukrea.com>
	<CA+2YH7uhXW=i+P1UMJRC6WLK_SNQnpoDFVi2dMUnveofKpHOWw@mail.gmail.com>
	<20110910204621.GC5456@jama.jama.net>
Date: Sat, 10 Sep 2011 23:21:55 +0200
X-Google-Sender-Auth: NWdLVhtce6CfXy6NpUIeTC6LnF4
Message-ID: <CA+2YH7vv3zkRdrOaJCz_gOOC_9h=aJBXsHLo8gPhZ_TJ1K9hyA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev mirror
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
X-List-Received-Date: Sat, 10 Sep 2011 21:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 10, 2011 at 10:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> there is patch on oe-devel for using .tar.bz for 173 instead of git,
> that's how I work arrouned it yesterday..

Thanks, and looks like connman needs that patch too.

Enrico


