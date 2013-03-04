Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UCZ09-0003X4-05
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 18:16:38 +0100
Received: by mail-ob0-f175.google.com with SMTP id uz6so1996458obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 09:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GkyTarYtFiZYvw6yI6GfpDuwdrP1HF+ek3p1rKKK988=;
	b=qHGhfffpqB7m5pLjU3vRhnNvCDp+oozwWZ8VX7K7fJ5F4dQIt/qcpuiMAlTNq41JoZ
	mU7q1gq18iPFChG60skL1nph0yEir+UisXxKPzju2u/EaaqKKZLcWn1f+Q6YxvFfWExe
	Mi/TMg40pcdgMoJ8ZOfAImyZ94ou+8PjfxGQ6Y+QJNccLtCui6uwMxtQkAnUQUTP8BVn
	pWC9Ph7e99YGBHJ+vkM+yrSkfhp0svfQXXikpn+3XbhJVNRzOVawKEeM7vK0wA/zhM/0
	OF0SyiXOkYGb9JaLLP5GohbKBymjYje88nTr6D8ALXRF5OEwhHrv8eFsoX7jNL8s1dQw
	9P4w==
MIME-Version: 1.0
X-Received: by 10.60.11.228 with SMTP id t4mr5491034oeb.42.1362416408502; Mon,
	04 Mar 2013 09:00:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Mon, 4 Mar 2013 09:00:08 -0800 (PST)
In-Reply-To: <1362407704.29587.39.camel@ted>
References: <1362407704.29587.39.camel@ted>
Date: Mon, 4 Mar 2013 14:00:08 -0300
X-Google-Sender-Auth: 96Nhr0-8kTN4uoYIHy5SiX2g4Vs
Message-ID: <CAP9ODKozO-vpHdqDWxPMnYaaCt6eZUy_EjoEfAeDObdSjKj2_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Completion Deadline for 1.4 looming
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
X-List-Received-Date: Mon, 04 Mar 2013 17:16:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 4, 2013 at 11:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The 1.4 release is scheduled for 2013/04/26. We have one milestone
> release before then, M5 on 2013/03/17. This is also the feature complete
> deadline.
>
> This means if there are features or other changes you want to see in
> 1.4, they need to be in by the 17th[1]. After the 17th we'll be doing
> bugfixing and stabilisation and new features will have to wait for 1.5.
>
> [1] Within reason, large unexpected invasive changes appearing on the
> 17th will probably not make it unless the solve world hunger or have an
> equally impressive benefit.

The systemd integration? Will it be  reworked so we have an upgrade path?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


