/*
Copyright © 2025 --config
*/
package cmd

import (
	"github.com/imoowi/dvmf/internal/env"
	"github.com/spf13/cobra"
)

// envCmd represents the env command
var envCmd = &cobra.Command{
	Use:   "env",
	Short: "Distribute env variables into multiple files.",
	Long: `Distribute env variables into multiple files.`,
	Run: func(cmd *cobra.Command, args []string) {
		env.Do(cfgFile)
	},
}

func init() {
	rootCmd.AddCommand(envCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// envCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// envCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")

}
