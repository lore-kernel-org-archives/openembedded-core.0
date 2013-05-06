Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UZOps-0007zx-LK
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 19:04:24 +0200
Received: by mail-oa0-f46.google.com with SMTP id j6so3703254oag.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZWW+T/1hZD0So+MV9Hp1pCayaEQPWik6zoAMCz3/qqQ=;
	b=VoP+L0N+KaOvF8fTVhHH/uB9gsoMLeOqqQN7WFCNTEzD4mZO7fnrHjDmuytqyhncDt
	fJPUh2vYMx9vXSSDQXZK3WaL6QAaExYrNj+oFRajs4Oh+cGLLkAqt3wdKVpFrWKn1/E0
	uThQjYTHgsAkUo3j/HSnBlUjAIGq6pPxTHh4Eh6IQrRyE6sTLUvWMz/TZTl3l3BkeZVT
	GOMzI14SvOsFdTcpupR1BFjJKl3uZ903BQBocdfE3ozw3Mahm7RZwsJ9gKawAnDpNjf7
	KTj6F6WK9oLxkNdMpa515GWvfqbLTU5em35uvbmvR48eYu5kDlsS0QoGeLurGsEBOLa1
	EL1g==
MIME-Version: 1.0
X-Received: by 10.182.108.165 with SMTP id hl5mr1903102obb.33.1367858784317;
	Mon, 06 May 2013 09:46:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 6 May 2013 09:46:24 -0700 (PDT)
In-Reply-To: <e7290195897547a542f5ca0f080a1a074a728351.1367857109.git.bruce.ashfield@windriver.com>
References: <cover.1367857109.git.bruce.ashfield@windriver.com>
	<e7290195897547a542f5ca0f080a1a074a728351.1367857109.git.bruce.ashfield@windriver.com>
Date: Mon, 6 May 2013 13:46:24 -0300
X-Google-Sender-Auth: XfLh9F9ReK0wqzrAde1HQJenVmg
Message-ID: <CAP9ODKremrsR9d8HDK+XdYpd0mC0G12cAmcNnU1v=cpF7bS1Mw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-yocto/3.8: udpate to v3.8.11
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
X-List-Received-Date: Mon, 06 May 2013 17:04:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 6, 2013 at 1:24 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Update the linux-yocto-3.8 SRCREVs to the korg 3.8.11 -stable release.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Typo in subject :-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


