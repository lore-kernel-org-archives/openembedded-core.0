Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UHhWJ-0002Dc-QU
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 22:23:44 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so6086138oag.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Pi4WhUfCYiickh25uVtUIR67lgu1CyFbkz25BWaHdMc=;
	b=i8nkTP6EXQHPKuLW8WEf0CZUYj6pEv8li4MT5svr+TPlAwIjSqIKWHJvFSHs7fefzE
	1jOpAGVxD5JwvO+vjfSYNBmzF3Zkb1jMEBvwhTaWbs61WTCVPlu3rT78PCs9rzIsEJbJ
	FuWamz177TAJKAX7FZzair/FCTAfngPG8NNCTLhvdw5u8PGXJJlhtYB7uv+5Er+mVNPA
	wjZWvx7NfmjgTmMs0fyA40ggsZdBfp3MB8TE/zX4U2ozmF0dI+GD9Noa7EwZmPbf0xuE
	+RP7QxKAL15vG9w5qGoG3PqdZybg//dNZVVCUQ1RoNEOhbmuD/AQTjA9iB/p+uh6hNjU
	TX7w==
MIME-Version: 1.0
X-Received: by 10.182.157.104 with SMTP id wl8mr7496004obb.79.1363640774929;
	Mon, 18 Mar 2013 14:06:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 18 Mar 2013 14:06:14 -0700 (PDT)
In-Reply-To: <1363639611-21822-2-git-send-email-jslater@windriver.com>
References: <1363639611-21822-1-git-send-email-jslater@windriver.com>
	<1363639611-21822-2-git-send-email-jslater@windriver.com>
Date: Mon, 18 Mar 2013 18:06:14 -0300
X-Google-Sender-Auth: d9TAvPuBwik2ho5pXh7Epopsi48
Message-ID: <CAP9ODKrk0S1g6TcLxs=iVuv3eBRgZgfhtwSDVaYzJawnAH7rRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH [v3] 1/1] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Mon, 18 Mar 2013 21:23:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 18, 2013 at 5:46 PM, Joe Slater <jslater@windriver.com> wrote:
> Rename and modifying existing recipes to use 2013b
> versions of time zone.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>

It seems a good timming to drop PR.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


