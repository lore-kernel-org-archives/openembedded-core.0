Received: from mail-ie0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsrbP-0001x2-V9
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:05:41 +0100
Received: by mail-ie0-f178.google.com with SMTP id c12so1708823ieb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 00:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mT1NXxFhKbtzjmrNLpvcpko4tHJ+L/btPOzfShZ4+So=;
	b=NOdADD5mQBbRGQsTWmGbBPGueQryWUzfnHq3EKqnr0T+eLYpSGJIPXXmHjOgZVlrWN
	szTIK0u3TQzB1awvLtF81IYe5NdgtRlzK1oQgv8BP6DNQCNaLRpBTm9KjXglnNfeRctF
	05LHIFvBqC63TiepMEvtI2PZ21uMUfNVJ36x/U0Bk3aXKxNWurYSnaC7KrkIqI99WIV9
	668exId3Wj5+9zg+PraERgoZeyQyK0GJlK/Rh1qQh6Oqq/lX5rJK4nNjN33dmi5sTk0N
	3eJTGM7MT33nMkfxGsQfgMhH5gbiDp4hSgPHtNJuvbJdoTHueWuWjlLQd4oHcyUKUK/c
	DIRw==
MIME-Version: 1.0
Received: by 10.50.11.226 with SMTP id t2mr780507igb.99.1357721427744; Wed, 09
	Jan 2013 00:50:27 -0800 (PST)
Received: by 10.42.167.196 with HTTP; Wed, 9 Jan 2013 00:50:27 -0800 (PST)
In-Reply-To: <50ED2BAD.5030405@oss.bmw-carit.de>
References: <50ED2BAD.5030405@oss.bmw-carit.de>
Date: Wed, 9 Jan 2013 10:50:27 +0200
Message-ID: <CAF6bG8cLVGAyphd=pk7T5eF8LS=BXb7+fy7uOyUzwBHSPKJxvg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problems with sending patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 09:05:41 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 10:34, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> Hi,
>
> I have been repeated trying to send a patch to this mailing list, but it
> seems that it never appears here.
> I have checked the commit extensively for some problem, I tried different
> ways of sending with format-patch and thunderbird, and git-send-email.
> And I have checked our mail server. However, none of these options helped.
>
> I have sent patches some weeks ago already, that's why I am surprised that
> it does not work anymore.
> Has something been changed lately for sending patches on the mailing list?
>
> Any pointers are welcome.

 Looking my inbox, I've received at least three times this patch from you:
[PATCH] site/common: deactivate a runtime check for ipv6-support in,
python >=2.7.1 that fails when cross-compiling

 If you still don't see them yourself, your end is probably just
noticing that you have sent them yourself and they should not be
displayed as incoming.


 - ML


